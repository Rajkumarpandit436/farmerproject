/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.farmer.open.discussion.helper;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

/**
 *
 * @author PANDIT
 */
public class Helper {

    public static boolean deleteFile(String path) {
        boolean f = false;

        try {
            File file = new File(path);
            f = file.delete();
        } catch (Exception e) {

        }
        return f;
    }

    public static boolean saveFile(InputStream is, String path) {
        boolean f = false;
        try {
            try (FileOutputStream fos = new FileOutputStream(path)) {
                //InputStream is = part.getInputStream();

                byte[] b = new byte[is.available()];
                is.read(b);
                fos.write(b);
                fos.flush();
                fos.close();
                f=true;
            }
        } catch (IOException e) {
            System.out.println(e);
        }
        return f;
    }
}
