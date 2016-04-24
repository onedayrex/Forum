package com.forum.util;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.awt.image.CropImageFilter;
import java.awt.image.FilteredImageSource;
import java.awt.image.ImageFilter;
import java.io.File;

/**
 * Created by Administrator on 2016/3/10.
 */
public class ImageCut {

    public static void imgCut(String srcImageFile, int x, int y, int desWidth,
                              int desHeight) {
        try {
            Image img;
            ImageFilter cropFilter;
            BufferedImage bi = ImageIO.read(new File(srcImageFile + "_src.jpg"));
            int srcWidth = bi.getWidth();
            int srcHeight = bi.getHeight();
            if (srcWidth >= desWidth && srcHeight >= desHeight) {
                Image image = bi.getScaledInstance(srcWidth, srcHeight, Image.SCALE_DEFAULT);
                cropFilter = new CropImageFilter(x, y, desWidth, desHeight);
                img = Toolkit.getDefaultToolkit().createImage(
                        new FilteredImageSource(image.getSource(), cropFilter));
                BufferedImage tag = new BufferedImage(desWidth, desHeight,
                        BufferedImage.TYPE_INT_RGB);
                Graphics g = tag.getGraphics();
                g.drawImage(img, 0, 0, null);
                g.dispose();
                //输出文件
                File file = new File(srcImageFile+"_src.jpg");
                file.delete();
                ImageIO.write(tag, "JPEG", new File(srcImageFile + "_cut.jpg"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
