package vn.edu.hcmuaf.fit.util;

import java.util.SplittableRandom;

public class RandomOTP {
    public static String generateOTP(int lengthOTP) {
        SplittableRandom splittableRandom = new SplittableRandom();
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < lengthOTP; i++) {
            sb.append(splittableRandom.nextInt(1,10));
        }
        return sb.toString();
    }
}
