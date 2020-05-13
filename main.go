package main

import (
	"dtouchexperts/controller"
	"dtouchexperts/model"
	"dtouchexperts/routes"
	"dtouchexperts/utils"
	"fmt"
	"net/http"
	"os"

	"github.com/gorilla/sessions"
	_ "github.com/jinzhu/gorm/dialects/postgres"
	"github.com/labstack/echo-contrib/session"
	"github.com/labstack/echo/v4"
	"github.com/labstack/echo/v4/middleware"
	"gopkg.in/go-playground/validator.v9"
)

func main() {
	// everything is initiaised(called here)
	e := echo.New()
	cfg := &model.Config{}

	if err := cfg.Load("./config.json"); err != nil {
		fmt.Println("cant load config.json", err)
		os.Exit(1)
	}
	db := model.Connect(cfg)
	defer db.Close()
	g := model.Globals{
		Db:   db,
		Cfg:  cfg,
		Echo: e,
	}
	p := utils.Environment{
		Echo: e,
		Db:   db,
		Cfg:  cfg,
	}
	e.Validator = &utils.CustomValidator{
		Validator: validator.New(),
	}
	// or
	// g.Db =db
	// g.Cfg = cfg
	e.Use(middleware.CORSWithConfig(middleware.CORSConfig{
		AllowOrigins:     []string{"http://localhost:3000"},
		AllowCredentials: true,
		AllowHeaders:     []string{echo.HeaderOrigin, echo.HeaderContentType, echo.HeaderAccept},
		AllowMethods:     []string{http.MethodGet, http.MethodHead, http.MethodPut, http.MethodPatch, http.MethodPost, http.MethodDelete},
	}))

	e.Use(middleware.Recover())
	e.Use(middleware.Logger())
	e.Use(session.Middleware(sessions.NewFilesystemStore("./tmp", []byte("!ilovejesus123!"))))

	e.POST("/createuser", controller.CreateHandler(&g))
	e.POST("/about", controller.AboutCreateHandler(&g))
	e.POST("/contact", controller.ContactusCreateHandler(&g))
	e.POST("/createprice", controller.CreatePriceHandler(&g))

	e.GET("/getusers", controller.GetHandler(&g))
	e.GET("/getdetails", controller.AboutGetHandler(&g))
	e.GET("/getcontacts", controller.ContactusGetHandler(&g))
	e.GET("/getprices", controller.GetPriceHandler(&g))

	e.GET("/getuser/:formid", controller.GetHandlerByID(&g))
	e.GET("/getdetail/:formid", controller.AboutGetHandlerByID(&g))
	e.GET("/getcontact/:formid", controller.ContactusGetHandlerByID(&g))
	e.GET("/getprice/:formid", controller.GetPriceHandlerByID(&g))

	e.PUT("/updateuser/:formid", controller.UpdateHandler(&g))
	e.PUT("/updatedetail/:formid", controller.AboutUpdateHandler(&g))
	e.PUT("/updatecontact/:formid", controller.ContactusUpdateHandler(&g))
	e.PUT("/updateprice/:formid", controller.UpdatePriceHandler(&g))

	e.DELETE("/deleteuser/:formid", controller.DeleteHandler(&g))
	e.DELETE("/deletedetail/:formid", controller.AboutDeleteHandler(&g))
	e.DELETE("/deletecontact/:formid", controller.ContactusDeleteHandler(&g))
	e.DELETE("/deleteprice/:formid", controller.DeletePriceHandler(&g))

	e.Static("/static", "./static/uploads")
	e.POST("/upload", controller.UploadImages(&g))

	e.POST("/createprice", controller.CreatePriceHandler(&g))

	startHandlers(&p)
	// e.Logger.Fatal(e.Start(":4000"))
}
func startHandlers(env *utils.Environment) {
	routes := []utils.Ihandler{
		&routes.Authentication{},
	}
	for _, rt := range routes {
		rt.Init("/api", env)
	}
	env.Log.Panic(env.Echo.Start(":4000").Error())
}
