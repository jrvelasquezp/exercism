package pangram
import "strings"

func IsPangram(input string) bool {
	is_pangram := true
	alphabet := "abcdefghijklmnopqrstuvwxyz"

	for _, character := range alphabet {
		is_pangram = strings.Contains(strings.ToLower(input), string(character)) && is_pangram
	}
    return is_pangram
}
