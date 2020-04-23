package capture;
import java.awt.Rectangle;
import java.awt.Robot;
import java.awt.Toolkit;
import java.awt.image.BufferedImage;
import java.io.File;
 
import javax.imageio.ImageIO;
 
public class CaptureSample {
 
    public CaptureSample() {
    	 String saveFilePath = "D:\\git_html\\html-source-repo\\dev_html\\WebContent\\private\\";
         String saveFileName = "test";
         String saveFileExtension = "png";
         
         try {
             Robot robot = new Robot();
             Rectangle rectangle = new Rectangle(Toolkit.getDefaultToolkit().getScreenSize());
             BufferedImage image = robot.createScreenCapture(rectangle);
             image.setRGB(0,0,100);
             
             File file = new File(saveFilePath+saveFileName+"."+saveFileExtension);
             ImageIO.write(image, saveFileExtension, file);
         } catch (Exception e){
             e.printStackTrace();
         }
    }
}


