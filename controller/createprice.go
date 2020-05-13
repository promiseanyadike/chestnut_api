package controller

import (
	"dtouchexperts/model"
	"fmt"
	"log"
	"net/http"
	"strconv"

	"github.com/labstack/echo/v4"
)

// GetPriceHandler ...
func GetPriceHandler(g *model.Globals) echo.HandlerFunc {
	return func(c echo.Context) error {
		// form := []model.Cms{}
		u := new([]model.Price)
		err := g.Db.Order("id").Find(u).Error
		if err != nil {
			log.Fatal(err)
		}
		return c.JSON(http.StatusCreated, u)
		// return nil
	}
}

// GetPriceHandlerByID ...
func GetPriceHandlerByID(g *model.Globals) echo.HandlerFunc {
	return func(c echo.Context) error {
		// form := []model.Cms{}
		id, err := strconv.Atoi(c.Param("formid"))
		if err != nil {
			return err
		}
		ID := int64(id)
		u := &model.Price{ID: ID}
		err = g.Db.Take(u).Error
		if err != nil {
			log.Fatal(err)
		}
		return c.JSON(http.StatusOK, u)
	}
}

// UpdatePriceHandler ...
func UpdatePriceHandler(g *model.Globals) echo.HandlerFunc {
	return func(c echo.Context) error {
		// form := []model.Cms{}
		id, err := strconv.Atoi(c.Param("formid"))
		if err != nil {
			return err
		}
		ID := int64(id)
		u := &model.Price{ID: ID}
		if err := c.Bind(u); err != nil {
			return err
		}
		err = g.Db.Save(u).Error
		if err != nil {
			log.Fatal(err)
		}
		return c.JSON(http.StatusOK, u)
	}
}

// DeletePriceHandler ...
func DeletePriceHandler(g *model.Globals) echo.HandlerFunc {
	return func(c echo.Context) error {
		id, err := strconv.Atoi(c.Param("formid"))
		if err != nil {
			return err
		}
		ID := int64(id)
		u := &model.Price{ID: ID}
		if err := c.Bind(u); err != nil {
			return err
		}
		err = g.Db.Delete(u).Error
		if err != nil {
			log.Fatal(err)
		} else {
			fmt.Println(u)
			return c.JSON(http.StatusOK, "Deleted Successfully")
		}
		return c.String(http.StatusOK, "id+Deleted")
	}
}

// CreatePriceHandler ...
func CreatePriceHandler(g *model.Globals) echo.HandlerFunc {
	return func(c echo.Context) error {
		// u := new(model.Cms)
		u := []model.Price{}
		if err := c.Bind(&u); err != nil {
			fmt.Println(err)
			return err
		}
		fmt.Printf("%#v", u)
		last := len(u)
		if last > 0 {
			for _, x := range u {
				fmt.Println(x)
				err := g.Db.Create(&x).Error
				if err != nil {
					log.Fatal(err)
				}
			}
		}
		return c.JSON(http.StatusOK, u)
	}
}
