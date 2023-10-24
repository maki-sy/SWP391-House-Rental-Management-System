/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utils;

import java.util.ArrayList;
import java.util.List;
import org.passay.CharacterRule;
import org.passay.EnglishCharacterData;
import org.passay.LengthRule;
import org.passay.PasswordData;
import org.passay.PasswordValidator;
import org.passay.Rule;
import org.passay.RuleResult;

/**
 *
 * @author DTS
 */
public class Validator {

    /**
     * Validate password. A satisfied password must contain at least 6
     * characters, 1 upper case, 1 lower case, and 1 special symbol.
     *
     * @param password
     * @return
     */
    public RuleResult validatePassword(String password) {
        // Create password rules
        // password must be between 6 and 99 characters (99 is just a symbol for infi)
        Rule lengthRule = new LengthRule(6, 99);
        // password must contain at least one upper-case character
        Rule upperRule = new CharacterRule(EnglishCharacterData.UpperCase, 1);
        // password must contain at least one lower-case character
        Rule lowerRule = new CharacterRule(EnglishCharacterData.LowerCase, 1);
        // password must contain at least 1 symbol (special character)
        Rule symbol = new CharacterRule(EnglishCharacterData.Special, 1);

        List<Rule> rules = new ArrayList<>();
        rules.add(lengthRule);
        rules.add(symbol);
        rules.add(upperRule);
        rules.add(lowerRule);

        PasswordValidator validator = new PasswordValidator(rules);

        PasswordData passwordData = new PasswordData(password);

        return validator.validate(passwordData);
    }

    public static void main(String[] args) {
        Validator validator = new Validator();
        RuleResult result = validator.validatePassword("123456aBc $");
        if (result.isValid()) {
            System.out.println("Password is valid");
        } else {
            System.out.println("Invalid password");
        }

    }
}
