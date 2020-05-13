package model

import (
	"github.com/jinzhu/gorm"
	"github.com/labstack/echo/v4"
	"go.uber.org/zap"
)

var (
	// AuthSessionName ...
	AuthSessionName = "Session"
)

// Globals ...
type Globals struct {
	Db   *gorm.DB
	Cfg  *Config
	Log  *zap.SugaredLogger
	Echo *echo.Echo
}
