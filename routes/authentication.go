package routes

import (
	"dtouchexperts/model"
	"dtouchexperts/utils"
	"errors"
	"net/http"

	"github.com/gorilla/sessions"
	"github.com/labstack/echo-contrib/session"
	"github.com/labstack/echo/v4"
	"github.com/labstack/gommon/log"
)

var (
	errInvalidCredentials = errors.New("Email or Password is incorrect")
)

// Authentication ...
type Authentication struct {
	Env    *utils.Environment
	Prefix string
}

// Init ...
func (s *Authentication) Init(prefix string, env *utils.Environment) error {
	s.Env = env
	s.Prefix = prefix

	g := env.Echo.Group(prefix)

	auth := g.Group("/auth")
	auth.POST("/login", s.Login)
	auth.GET("/logout", s.Logout)
	auth.GET("/users", s.GetUsers)
	return nil
}

// GetUsers ...
func (s *Authentication) GetUsers(c echo.Context) error {
	res := &utils.Response{}
	admin := model.Authentications{}

	list, err := admin.All(s.Env.Db)

	if err != nil {
		res.SetError(err)
		return c.JSON(http.StatusOK, res)
	}

	for _, usr := range list {
		usr.Password = "***"
	}

	log.Info(list)

	res.Set("users", list)
	return c.JSON(http.StatusOK, res)
}

// Login ...
func (s *Authentication) Login(c echo.Context) error {
	res := &utils.Response{}
	adminUser := &model.Authentications{}
	form := &model.LoginForm{}

	// Bind request body to form
	if err := c.Bind(form); err != nil {
		res.SetError(err)
		return c.JSON(http.StatusBadRequest, res)
	}
	// Validate form
	if err := c.Validate(form); err != nil {
		res.SetError(err)
		return c.JSON(http.StatusOK, res)
	}
	// Get the users email
	err := adminUser.GetByEmail(s.Env.Db, form.Email)
	if err != nil {
		res.SetError(errInvalidCredentials)
		return c.JSON(http.StatusOK, res)
	}

	if !utils.CheckPasswordHash(form.Password, adminUser.Password) {
		res.SetError(errInvalidCredentials)
		return c.JSON(http.StatusOK, res)
	}

	adminUser.Password = "***" // conceal password after use
	sess, _ := session.Get(model.AuthSessionName, c)
	sess.Options = &sessions.Options{
		Path:     "/",
		MaxAge:   86400, // setting cookie expires in a day
		HttpOnly: false,
	}
	sess.Values["id"] = adminUser.ID
	sess.Values["email"] = utils.Base64Encode(adminUser.Email)
	sess.Values["isLoggedIn"] = true
	sess.Values["role"] = adminUser.RoleID
	sess.Save(c.Request(), c.Response())

	// LogData := models.LogData{}
	res.SetData(adminUser)
	return c.JSON(http.StatusOK, res)
}

// Logout ...
func (s *Authentication) Logout(c echo.Context) error {
	res := &utils.Response{}
	sess, err := session.Get(model.AuthSessionName, c)
	if err != nil {
		res.SetError(err)
		return c.JSON(http.StatusBadRequest, res)
	}

	sess.Options = &sessions.Options{
		Path:     "/",
		MaxAge:   -1, // delete cookie for the session
		HttpOnly: false,
	}

	sess.Save(c.Request(), c.Response())
	res.Set("logout", true)
	return c.JSON(http.StatusOK, res)
}
