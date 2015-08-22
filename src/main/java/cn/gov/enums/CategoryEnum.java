package cn.gov.enums;

/**
 * Created by 王勇 on 2015/8/22.
 */
public enum CategoryEnum {

    SUBJECT("1"), PAGE("2"), SPECIAL("3"), LINK("4");

    private String value;

    CategoryEnum(String value) {
        this.value = value;
    }

    @Override
    public String toString() {
        return this.value;
    }

}
