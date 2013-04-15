package grailsapplication2

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.UnsupportedEncodingException;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Image;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.BarcodeQRCode;
import com.itextpdf.text.pdf.PdfWriter;

public class PdfQR {

  /**
   * @param args
   * @throws DocumentException 
   * @throws FileNotFoundException 
   * @throws UnsupportedEncodingException 
   */
  public static void generarFactura() throws FileNotFoundException, 
    DocumentException, UnsupportedEncodingException {
    
    Document document = new Document(new Rectangle(PageSize.A4));
    PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream("qrcode1.pdf"));
    document.open();

    //QR Code Barcode
    document.add(new Paragraph("RetroShop"));
        
    BarcodeQRCode qrcode = new BarcodeQRCode(
        "www.google.com", 0, 0, null);
    Image image = qrcode.getImage();
    
    //Add Barcode to PDF document
        document.add(image);
        document.close();
        
  }

}