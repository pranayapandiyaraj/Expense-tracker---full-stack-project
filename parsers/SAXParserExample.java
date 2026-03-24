import java.io.File;
import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

public class SAXParserExample {
    public static void main(String[] args) {
        try {
            File inputFile = new File("library.xml");
            SAXParserFactory factory = SAXParserFactory.newInstance();
            SAXParser saxParser = factory.newSAXParser();
            
            DefaultHandler handler = new DefaultHandler() {
                boolean bTitle = false;

                public void startElement(String uri, String localName, String qName, Attributes attributes) throws SAXException {
                    if (qName.equalsIgnoreCase("TITLE")) {
                        bTitle = true;
                    }
                }

                public void characters(char ch[], int start, int length) throws SAXException {
                    if (bTitle) {
                        System.out.println("Book Title: " + new String(ch, start, length));
                        bTitle = false;
                    }
                }
            };
            
            System.out.println("Extracting Book Titles from Library XML:");
            saxParser.parse(inputFile, handler);
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
