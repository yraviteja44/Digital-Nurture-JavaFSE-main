// Main.java
public class Main {

    public static void main(String[] args) {

        DocumentFactory word = new WordFactory();
        DocumentFactory pdf = new PdfFactory();
        DocumentFactory excel = new ExcelFactory();

        word.displayDocument();
        pdf.displayDocument();
        excel.displayDocument();
    }
}