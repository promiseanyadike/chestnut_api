package model

import (
	"encoding/json"
	"fmt"
	"io/ioutil"
	"log"
	"time"

	"github.com/jinzhu/gorm"
)

// Laundry ...
type Laundry struct {
	ID          int64     `json:"id"`
	Title       string    `json:"title"` // 8bytes
	Content     string    `json:"content"`
	Image       string    `json:"image"`
	DateCreated time.Time `json:"date_created"` //8 bytes(boolean is 1 byte)
	DateUpdated time.Time `json:"date_updated"` //32 bytes of data overall just for one person alone

}

// About ...
type About struct {
	ID          int64     `json:"id"`
	Title       string    `json:"title"`
	Content     string    `json:"content"`
	Images      string    `json:"images"`
	DateCreated time.Time `json:"date_created"`
	DateUpdated time.Time `json:"date_updated"`
}

// Contactus ...
type Contactus struct {
	ID          int64     `json:"id"`
	Title       string    `json:"title"`
	Content     string    `json:"content"`
	Images      string    `json:"images"`
	DateCreated time.Time `json:"date_created"`
	DateUpdated time.Time `json:"date_updated"`
}

// Uploadimages ...
type Uploadimages struct {
	ID          int64     `json:"id"`
	Title       string    `json:"title"`
	Content     string    `json:"content"`
	Images      string    `json:"images"`
	DateCreated time.Time `json:"date_created"`
	DateUpdated time.Time `json:"date_updated"`
}

// Price ...
type Price struct {
	ID          int64     `json:"id"`
	Name        string    `json:"name"` // 8bytes
	Price       string    `json:"price"`
	DateCreated time.Time `json:"date_created"` //8 bytes(boolean is 1 byte)
	DateUpdated time.Time `json:"date_updated"` //32 bytes of data overall just for one person alone

}

// Config ...
type Config struct {
	Host       string
	DbName     string
	DbUser     string
	DbPassword string
}

// Connect ...
func Connect(cfg *Config) *gorm.DB {
	connStr := fmt.Sprintf(
		"user=%s password=%s dbname=%s sslmode=disable",
		cfg.DbUser, cfg.DbPassword, cfg.DbName,
	)

	db, err := gorm.Open("postgres", connStr)
	if err != nil {
		panic("failed to connect database")
	} else {
		fmt.Println("DB connected..")
	}
	db.SingularTable(true) // removes pluralised table
	return db              // special type "*gorm.DB" of returned  value
}

// Load ...
func (s *Config) Load(file string) error {
	data, err := ioutil.ReadFile(file) // the package returns a byte of slice and error(2 values)
	//therefore we have to initialise two varies for the two returned value, one for byte(s) and the other for error (err)
	if err != nil {
		log.Println(err)
		return err
	}

	if err := json.Unmarshal(data, s); err != nil {
		log.Println(err)
		return err
	}
	return nil
}

// Roles with lowest value have highest privilege
const (
	// RoleSuperAdmin for super admin
	RoleSuperAdmin int64 = iota

	// RoleAdmin for admin
	RoleAdmin

	// RoleStaff for staff
	RoleStaff
)

// Authentications ...
type Authentications struct {
	ID          int       `json:"id"`
	RoleID      int64     `json:"role_id"`
	Email       string    `json:"username"`
	Password    string    `json:"password"`
	DateCreated time.Time `json:"created_at"`
}

// LoginForm ...
type LoginForm struct {
	Email    string `json:"email" validate:"required"`
	Password string `json:"password" validate:"required"`
}

// All ... gets all new record
func (c *Authentications) All(db *gorm.DB) (admin []*Authentications, err error) {
	err = db.Find(&admin).Error
	return
}

// GET ...
func (c *Authentications) GET(db *gorm.DB, id string) error {
	return db.First(c, "id = ?", id).Error
}

// Create a new record
func (c *Authentications) Create(db *gorm.DB) error {
	return db.Create(c).Error
}

// GetByEmail ...
func (c *Authentications) GetByEmail(db *gorm.DB, email string) error {
	return db.Find(c, "email = ?", email).Error
}
