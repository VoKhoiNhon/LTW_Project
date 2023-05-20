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
import vn.edu.hcmuaf.fit.beans.User;
import vn.edu.hcmuaf.fit.service.LogSercive;
import vn.edu.hcmuaf.fit.service.UserService;

import java.io.OutputStream;
import java.util.Collections;
import java.util.List;

public class Export {
    static List<User> list =  UserService.getInstance().getListUser();

    public static void getFileUserExcel(OutputStream outputStream) {
        try {
            Collections.reverse(list);
            // Tạo workbook mới
            XSSFWorkbook workbook = new XSSFWorkbook();

            // Tạo trang mới trong workbook
            XSSFSheet sheet = workbook.createSheet("Data");

            // Thêm tiêu đề cho file Excel
            XSSFRow headerRow = sheet.createRow(0);
            XSSFCell cell = headerRow.createCell(0);
            cell.setCellValue("ID");
            cell = headerRow.createCell(1);
            cell.setCellValue("address");
            cell = headerRow.createCell(2);
            cell.setCellValue("username ");
            cell = headerRow.createCell(3);
            cell.setCellValue("phone");
            cell = headerRow.createCell(4);
            cell.setCellValue("email");
            cell = headerRow.createCell(5);
            cell.setCellValue("birthday");
            cell = headerRow.createCell(6);
            cell.setCellValue("datesinup");

            // Thêm dữ liệu vào trang
            int rowNum = 1;
            for (User l : list) {
                XSSFRow row = sheet.createRow(rowNum++);
                cell = row.createCell(0);
                cell.setCellValue(l.getIdUser());
                cell = row.createCell(1);
                cell.setCellValue(l.getAddress());
                cell = row.createCell(2);
                cell.setCellValue(l.getNameUser());
                cell = row.createCell(3);
                cell.setCellValue(l.getPhone());
                cell = row.createCell(4);
                cell.setCellValue(l.getEmail());
                cell = row.createCell(5);
                cell.setCellValue(l.getBirthday());
                cell = row.createCell(6);
                cell.setCellValue(l.getDateSignup());


            }
            // Lưu workbook vào file Excel
//            FileOutputStream outputStream = new FileOutputStream("D:\\test\\data.xlsx");
            workbook.write(outputStream);
            workbook.close();

            System.out.println("Data exported successfully to Excel!");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void getFileUserPDF(OutputStream outputStream) {
        Document document = new Document(PageSize.A4, 20, 20, 20, 20);
        Collections.reverse(list);
        try {
            // Tạo writer để ghi dữ liệu vào file PDF
            PdfWriter.getInstance(document, outputStream);
            document.open();
            // Tạo bảng để chứa dữ liệu
            PdfPTable table = new PdfPTable(7);
            PdfPCell cell;
            cell = new PdfPCell(new Paragraph("User"));
            cell.setColspan(7);
            table.addCell(cell);
            table.addCell("ID");
            table.addCell("address");
            table.addCell("username");
            table.addCell("phone");
            table.addCell("email");
            table.addCell("birthday");
            table.addCell("datesignup");


            for (User l : list) {
                table.addCell(l.getIdUser());
                table.addCell(l.getAddress());
                table.addCell(l.getNameUser());
                table.addCell(l.getPhone());
                table.addCell(l.getEmail());
                table.addCell(String.valueOf(l.getBirthday()));
                table.addCell(String.valueOf(l.getDateSignup()));


            }
            document.add(table);
            document.close();
            System.out.println("Data exported successfully to PDF!");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


}
