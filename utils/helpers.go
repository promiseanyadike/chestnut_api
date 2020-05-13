package utils

import (
	"encoding/base64"
	"errors"
	"strconv"
	"strings"

	"github.com/gorilla/sessions"
	"github.com/labstack/echo-contrib/session"
	"github.com/labstack/echo/v4"
	"golang.org/x/crypto/bcrypt"
)

// HashPassword return a bcrypt hash of the input string
// and a non-nil error if an error occurs
func HashPassword(password string) (string, error) {
	bytes, err := bcrypt.GenerateFromPassword([]byte(password), 14)
	return string(bytes), err
}

// CheckPasswordHash compares the hash with a string
func CheckPasswordHash(password, hash string) bool {
	err := bcrypt.CompareHashAndPassword([]byte(hash), []byte(password))
	return err == nil
}

// Base64Encode ...
func Base64Encode(src string) string {
	return base64.StdEncoding.EncodeToString([]byte(src))
}

// Base64Decode ...
func Base64Decode(src string) (string, error) {
	res, err := base64.StdEncoding.DecodeString(src)
	return string(res), err
}

// Capitalize ...
func Capitalize(val *string) string {
	Capitalized := strings.Title(strings.ToLower(*val))
	return Capitalized
}

// ToString ...
func ToString(val *int) string {
	return strconv.Itoa(*val)
}

// ToNum ...
func ToNum(str string) (int, error) {
	return strconv.Atoi(str)
}

// SessionFromEchoContext ...
func SessionFromEchoContext(c echo.Context, name string) (*sessions.Session, error) {
	sess, err := session.Get(name, c)
	if err != nil {
		return nil, errors.New("session has expired")
	}
	return sess, err
}

// GetRoleNumFromEchoSession ...
func GetRoleNumFromEchoSession(c echo.Context, name string) (rn int64, err error) {

	sess, err := SessionFromEchoContext(c, name)
	if err != nil {
		return 0, err
	}
	val, ok := sess.Values["role"]
	if !ok {
		return 0, errors.New("session is invalid")
	}
	rn = val.(int64)
	return
}
