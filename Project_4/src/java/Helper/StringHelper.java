package Helper;

public class StringHelper {
    public static String parseLikeQuery(String query) {
        return "%" + query + "%";
    }
}