package controller

import (
	"dtouchexperts/model"
	"fmt"
	"io"
	"log"
	"net/http"
	"os"
	"strconv"
	"time"

	"github.com/labstack/echo/v4"
)

// CreateHandler ...
func CreateHandler(g *model.Globals) echo.HandlerFunc {
	return func(c echo.Context) error {
		// u := new(model.Cms)
		u := []model.Laundry{}
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

// GetHandler ...
func GetHandler(g *model.Globals) echo.HandlerFunc {
	return func(c echo.Context) error {
		// form := []model.Cms{}
		u := new([]model.Laundry)
		// "order",this sorts the data appropriately. Preventing change in the index position during update
		err := g.Db.Order("id").Find(u).Error
		if err != nil {
			log.Fatal(err)
		}
		return c.JSON(http.StatusCreated, u)
		// return nil
	}
}

// GetHandlerByID ...
func GetHandlerByID(g *model.Globals) echo.HandlerFunc {
	return func(c echo.Context) error {
		// form := []model.Cms{}
		id, err := strconv.Atoi(c.Param("formid"))
		if err != nil {
			return err
		}
		ID := int64(id)
		u := &model.Laundry{ID: ID}
		err = g.Db.Take(u).Error
		if err != nil {
			log.Fatal(err)
		}
		return c.JSON(http.StatusOK, u)
	}
}

// UpdateHandler ...
func UpdateHandler(g *model.Globals) echo.HandlerFunc {
	return func(c echo.Context) error {
		// form := []model.Cms{}
		id, err := strconv.Atoi(c.Param("formid"))
		if err != nil {
			return err
		}
		ID := int64(id)
		u := &model.Laundry{ID: ID}
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

// DeleteHandler ...
func DeleteHandler(g *model.Globals) echo.HandlerFunc {
	return func(c echo.Context) error {
		id, err := strconv.Atoi(c.Param("formid"))
		if err != nil {
			return err
		}
		ID := int64(id)
		u := &model.Laundry{ID: ID}
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

// UploadImages ... about page
func UploadImages(g *model.Globals) echo.HandlerFunc {
	return func(c echo.Context) error {
		// read the form fields
		uploadID := c.FormValue("ID")
		log.Printf("%v# \n %T", uploadID, uploadID)
		uploadTitle := c.FormValue("Title")
		uploadContent := c.FormValue("Content")
		// read file
		file, err := c.FormFile("images")
		if err != nil {
			fmt.Print("277", err)
			return err
		}
		src, err := file.Open()
		if err != nil {
			fmt.Printf("%s", err)
			return err
		}
		defer src.Close()
		dst, err := os.Create("./static/uploads/" + file.Filename)
		log.Printf("%#v", file)
		if err != nil {
			fmt.Printf("%s", err)
			return err
		}
		defer dst.Close()
		if _, err = io.Copy(dst, src); err != nil {
			fmt.Printf("%s", err)
			return err
		}
		id, err := strconv.Atoi(uploadID)
		if err != nil {
			fmt.Printf("%s", err)
			return err
		}
		filePath := "static/" + file.Filename
		uploadIDInt := int64(id)
		u := &model.Uploadimages{ID: uploadIDInt, Title: uploadTitle, Content: uploadContent, Images: filePath, DateCreated: time.Now(), DateUpdated: time.Now()}
		if err := c.Bind(u); err != nil {
			return err
		}
		err = g.Db.Create(u).Error
		if err != nil {
			log.Fatal(err)
		}
		return c.JSON(http.StatusOK, u)
	}
}
