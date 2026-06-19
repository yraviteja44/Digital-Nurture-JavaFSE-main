import java.util.Arrays;
import java.util.Comparator;

public class SearchDemo {

    // Linear Search
    public static Product linearSearch(Product[] products, String name) {

        for (Product product : products) {
            if (product.productName.equalsIgnoreCase(name)) {
                return product;
            }
        }
        return null;
    }

    // Binary Search
    public static Product binarySearch(Product[] products, String name) {

        int low = 0;
        int high = products.length - 1;

        while (low <= high) {

            int mid = (low + high) / 2;

            int result = products[mid].productName.compareToIgnoreCase(name);

            if (result == 0)
                return products[mid];

            else if (result < 0)
                low = mid + 1;

            else
                high = mid - 1;
        }

        return null;
    }

    public static void main(String[] args) {

        Product[] products = {

                new Product(101, "Laptop", "Electronics"),
                new Product(102, "Mobile", "Electronics"),
                new Product(103, "Shoes", "Fashion"),
                new Product(104, "Watch", "Accessories"),
                new Product(105, "Keyboard", "Electronics")

        };

        System.out.println("Linear Search");

        Product p1 = linearSearch(products, "Watch");

        if (p1 != null)
            p1.display();
        else
            System.out.println("Product Not Found");

        Arrays.sort(products, Comparator.comparing(product -> product.productName));

        System.out.println("\nBinary Search");

        Product p2 = binarySearch(products, "Watch");

        if (p2 != null)
            p2.display();
        else
            System.out.println("Product Not Found");
    }
}