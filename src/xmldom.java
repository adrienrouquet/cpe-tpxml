import java.io.*;
import javax.xml.parsers.*;
import org.xml.sax.SAXException;
import org.w3c.dom.*;

public class xmldom
{
	public static void main(String[] args)
	{
		try
		{
			File fdom = new File("data-xml.xml");
			DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
			DocumentBuilder builder = factory.newDocumentBuilder();
			
			Document dom = builder.parse(fdom);
			
			Node rootElement = dom.getDocumentElement();
			
			String result = "";
			result = Navigate (rootElement, 1, result);			
			
			System.out.println(result);
		}
		catch (ParserConfigurationException e)
		{
			e.printStackTrace();
		}
		catch (SAXException e)
		{
			e.printStackTrace();
		}
		catch (IOException e)
		{
			e.printStackTrace();
		}
	}

	private static String Navigate(Node node, int number, String result)
	{
		number++;	
		
		if (node.getNodeType() == Node.TEXT_NODE)
		{
			result += "\n\t" + node.getNodeValue();
		}
		
		int attLength = 0;
		if (node.getAttributes() != null)
		{
			attLength = node.getAttributes().getLength();
		}
		
		for (int i = 0 ; i < attLength ; i++)
		{
			Node current = node.getAttributes().item(i);
			
			result += "\t" + current.getNodeName() + " [" + current.getNodeValue() + "]";
		}
		
		if (node.hasChildNodes())
		{
			NodeList children = node.getChildNodes();
			
			for (int i = 0 ; i < children.getLength() ; i++)
			{
				result += Navigate(children.item(i), number, result);
			}
		}
		
		return result;
	}
	
}
