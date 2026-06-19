

public class Main {

    public static void main(String[] args) {

        Computer gamingPC = new Computer.Builder()
                .setCPU("Intel Core i9")
                .setRAM("32 GB")
                .setStorage("1 TB SSD")
                .setGraphicsCard("NVIDIA RTX 4070")
                .setOperatingSystem("Windows 11")
                .build();

        Computer officePC = new Computer.Builder()
                .setCPU("Intel Core i5")
                .setRAM("16 GB")
                .setStorage("512 GB SSD")
                .setOperatingSystem("Windows 10")
                .build();

        gamingPC.display();
        officePC.display();
    }
}