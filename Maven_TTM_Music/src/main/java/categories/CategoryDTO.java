package categories;
public class CategoryDTO {
    private String categoryid,name;

    public CategoryDTO(String categoryid, String name) {
        this.categoryid = categoryid;
        this.name = name;
    }

    public String getCategoryid() {
        return categoryid;
    }

    public void setCategoryid(String categoryid) {
        this.categoryid = categoryid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "CategoryDTO{" + "categoryid=" + categoryid + ", name=" + name + '}';
    }
    
}
