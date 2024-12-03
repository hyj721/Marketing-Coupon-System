package edu.uestc.onecoupon.merchant.admin.tasks;

import com.github.javafaker.Address;
import com.github.javafaker.Faker;
import com.github.javafaker.PhoneNumber;
import org.junit.jupiter.api.Test;

import java.util.Locale;

public class FakerTests {
    @Test
    public void testFaker() {
        Faker faker = new Faker(Locale.CHINA);

        String fullName = faker.name().fullName();
        System.out.println(fullName);

        PhoneNumber phoneNumber = faker.phoneNumber();
        System.out.println(phoneNumber.cellPhone());

        String email = faker.internet().emailAddress();
        System.out.println(email);

        Address address = faker.address();
        String fullAddress = address.country() + " " + address.state() + " " + address.city() + " " + address.streetAddress();
        System.out.println(fullAddress);

    }
}
