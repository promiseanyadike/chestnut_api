package utils

import (
	"dtouchexperts/model"

	"github.com/jinzhu/gorm"

	// "github.com/labstack/echo"
	"github.com/labstack/echo/v4"

	"go.uber.org/zap"
)

// Environment ...
type Environment struct {
	Echo  *echo.Echo
	Db    *gorm.DB
	Cfg   *model.Config
	Log   *zap.Logger
	Paths map[string]string
	URL   map[string]string
}

// NewEnvironment ...
// func NewEnvironment(echo *echo.Echo, Db *gorm.DB, cfg *model.Config, log *zap.Logger) *Environment {
// 	return &Environment{
// 		Echo:  echo,
// 		Db:    Db,
// 		Cfg:   cfg,
// 		Log:   log,
// 		Paths: GetPath(),
// 		URL:   BaseURL(),
// 	}
// }

// Ihandler ...
type Ihandler interface {
	Init(prefix string, env *Environment) error
}
