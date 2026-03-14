package vn.myproject.laptopshop.domain.dto;

import jakarta.validation.constraints.NotBlank;
import vn.myproject.laptopshop.service.validator.RegisterChecked;

@RegisterChecked
public class RegisterDTO {
    private String firstName;
    private String lastName;

    @NotBlank(message = "Không được để trống")
    private String email;

    @NotBlank(message = "Không được để trống password")
    private String password;

    @NotBlank(message = "Không được để trống Confirm password")
    private String confirmPassword;

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getpassword() {
        return password;
    }

    public void setpassword(String password) {
        this.password = password;
    }

    public String getConfirmPassword() {
        return confirmPassword;
    }

    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }

}
