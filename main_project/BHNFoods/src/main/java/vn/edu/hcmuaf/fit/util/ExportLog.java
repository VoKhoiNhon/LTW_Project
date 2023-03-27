package vn.edu.hcmuaf.fit.util;

import com.itextpdf.text.Document;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import vn.edu.hcmuaf.fit.beans.Log;
import vn.edu.hcmuaf.fit.service.LogSercive;

import java.io.FileOutputStream;

import java.util.List;

public class ExportLog {
    static List<Log> list = LogSercive.getInstance().getAllLog();

    public static void getFileExcel() {
        try {
            // Tạo workbook mới
            XSSFWorkbook workbook = new XSSFWorkbook();

            // Tạo trang mới trong workbook
            XSSFSheet sheet = workbook.createSheet("Data");

            // Thêm tiêu đề cho file Excel
            XSSFRow headerRow = sheet.createRow(0);
            XSSFCell cell = headerRow.createCell(0);
            cell.setCellValue("ID");
            cell = headerRow.createCell(1);
            cell.setCellValue("level");
            cell = headerRow.createCell(2);
            cell.setCellValue("user");
            cell = headerRow.createCell(3);
            cell.setCellValue("src");
            cell = headerRow.createCell(4);
            cell.setCellValue("content");
            cell = headerRow.createCell(5);
            cell.setCellValue("status");
            cell = headerRow.createCell(6);
            cell.setCellValue("browser name");
            cell = headerRow.createCell(7);
            cell.setCellValue("Ip");

            // Thêm dữ liệu vào trang
            int rowNum = 1;
            for (Log l : list) {
                XSSFRow row = sheet.createRow(rowNum++);
                cell = row.createCell(0);
                cell.setCellValue(l.getId());
                cell = row.createCell(1);
                cell.setCellValue(l.getLevelWithName());
                cell = row.createCell(2);
                cell.setCellValue(l.getUser());
                cell = row.createCell(3);
                cell.setCellValue(l.getSrc());
                cell = row.createCell(4);
                cell.setCellValue(l.getContent());
                cell = row.createCell(5);
                cell.setCellValue(l.getStatus());
                cell = row.createCell(6);
                cell.setCellValue(l.getbrowerName());
                cell = row.createCell(7);
                cell.setCellValue(l.getLocationIpClient());


            }
            // Lưu workbook vào file Excel
            FileOutputStream outputStream = new FileOutputStream("D:\\test\\data.xlsx");
            workbook.write(outputStream);
            workbook.close();
            System.out.println("Data exported successfully to Excel!");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void getFilePDF() {
        Document document = new Document(PageSize.A4, 50, 50, 50, 50);
        try {
            // Tạo writer để ghi dữ liệu vào file PDF
            PdfWriter.getInstance(document, new FileOutputStream("D:\\test\\data.pdf"));
            document.open();
            // Tạo bảng để chứa dữ liệu
            PdfPTable table = new PdfPTable(7);
            PdfPCell cell;
            cell = new PdfPCell(new Paragraph("Log"));
            cell.setColspan(7);
            table.addCell(cell);
            table.addCell("ID");
            table.addCell("level");
            table.addCell("user");
            table.addCell("Src");
            table.addCell("Content");
            table.addCell("Status");
            table.addCell("browserName");
//            table.addCell("ip");
            for (Log l : list) {
                table.addCell(Integer.toString(l.getId()));
                table.addCell(l.getLevelWithName());
                table.addCell(l.getUser());
                table.addCell(l.getSrc());
                table.addCell(l.getContent());
                table.addCell(Integer.toString(l.getStatus()));
                table.addCell(l.getbrowerName());
//                table.addCell(l.getLocationIpClient());
            }
            document.add(table);
            document.close();
            System.out.println("Data exported successfully to PDF!");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

//    public static void main(String[] args) {
////        getFileExcel();
//        getFilePDF();
//        System.out.println(123);
//    }
}
