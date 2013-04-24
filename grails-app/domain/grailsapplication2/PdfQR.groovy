package grailsapplication2

import grailsapplication2.Producto
import grailsapplication2.Usuario
import grailsapplication2.Carrito
import grailsapplication2.Compra

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
import com.itextpdf.text.pdf.PdfPTable
import com.itextpdf.text.pdf.PdfPCell
import java.nio.file.Path

public class PdfQR {

    /**
     * @param args
     * @throws DocumentException 
     * @throws FileNotFoundException 
     * @throws UnsupportedEncodingException 
     */
    public static byte[] generarFactura(Long idcompra) throws FileNotFoundException, 
    DocumentException, UnsupportedEncodingException {
     
        def compra=Compra.findById(idcompra)
    def monto=compra.getMonto(idcompra)
        def usuario=Usuario.findById(compra.usuario.id)
        Document document = new Document(new Rectangle(PageSize.A4));
        FileOutputStream factura=new FileOutputStream(usuario.nombre+"-"+idcompra+".pdf") 
        PdfWriter writer = PdfWriter.getInstance(document, factura); 
        document.open();
        document.add(new Paragraph("RetroShop"));
        document.add(new Paragraph(" "))
        document.add(new Paragraph("Cliente: "+usuario.nombre+" "+usuario.apellido+" / Direccion:"+usuario.direccion))
        document.add(new Paragraph(" "))
        document.add(new Paragraph("Orden de Compra #$idcompra#"))
        document.add(new Paragraph(" "))
        document.add(new Paragraph("Detalle de Productos"))
        document.add(new Paragraph(" "))
       
        def carro=Carrito.findAllByCompra(compra)
        ArrayList<Producto> p=new ArrayList<Producto>()
        ArrayList subtotales= new ArrayList()
        carro.each{c -> p.add(c.producto)
            subtotales.add(c.subtotal)}
        
        PdfPTable table = new PdfPTable(2); 

        PdfPCell cell1 = new PdfPCell(new Paragraph("Producto"));
        PdfPCell cell2 = new PdfPCell(new Paragraph("Monto"));
        
        p.each{pr ->  table.addCell(new PdfPCell(new Paragraph(pr.nombre)));//document.add(new Paragraph(pr.nombre))
            //document.add(new Paragraph(pr.descripcion))
        }
        subtotales.each{ x -> table.addCell(new PdfPCell(new Paragraph(x.toString())))}
        
        //   table.addCell(cell1);
        //   table.addCell(cell2);
        document.add(table);
        
        document.add(new Paragraph("Monto total: "+monto))
        //QR Code Barcode
        BarcodeQRCode qrcode = new BarcodeQRCode("http://localhost:7070/GrailsApplication2/compra/entrega/$idcompra", 5, 5, null);
        Image image = qrcode.getImage();
        image.scalePercent(400,400)
        //Add Barcode to PDF document
        document.add(new Paragraph("Para uso interno"))
        document.add(image);
        
        File path= new File(usuario.nombre+"-"+idcompra+".pdf")
        byte[] result=path.getBytes()
      
        
  
        document.close();
        factura.close();
       // path.delete();
        return path.getBytes()
    }

}