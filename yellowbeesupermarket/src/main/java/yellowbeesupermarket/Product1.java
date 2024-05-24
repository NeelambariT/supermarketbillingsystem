package yellowbeesupermarket;

public class Product1 {

	



    private String pcode;
    private String pname;
    private String type;
    private Double rate;
    
    public Product1(String pcode, String pname, String type, Double rate) {
        this.pcode = pcode;
        this.pname = pname;
        this.type = type;
        this.rate = rate;
    }
    
    // Getters (and optionally setters if needed)
    public String getPcode() { return pcode; }
    public String getPname() { return pname; }
    public String gettype() { return type; }
    public Double getRate() { return rate; }
}

