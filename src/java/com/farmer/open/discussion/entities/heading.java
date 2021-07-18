
package com.farmer.open.discussion.entities;


public class heading {
    
    private int id;
    private String heading;
    private String about;

    public heading(int id, String heading, String about) {
        this.id = id;
        this.heading = heading;
        this.about = about;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getHeading() {
        return heading;
    }

    public void setHeading(String heading) {
        this.heading = heading;
    }

    public String getAbout() {
        return about;
    }

    public void setAbout(String about) {
        this.about = about;
    }
    
    
}
