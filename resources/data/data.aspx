<%@Page Language="C#" ContentType="text/json" ResponseEncoding="utf-8" %>
<%@Import Namespace="System" %>
<%@Import Namespace="System.Net" %>
<%@Import Namespace="System.Data" %>
<%@Import Namespace="System.IO" %>

<script language="c#" runat="server">

void Page_Load(object sender, EventArgs e) {
  
  //The URL for the service
  string baseUrl = Request.QueryString["url"];
  //Set up a new webclient
  WebClient client = new WebClient ();
  //Open a connection to the URL
  Stream data = client.OpenRead (baseUrl);
  //Read from the URL
  StreamReader reader = new StreamReader (data);
  //Assign data from URL to s
  string s = reader.ReadToEnd ();
  //Declare a variable and write the geojson data after it
  //string myurl = Request.QueryString["url"]; 
  //Response.Write(myurl);
  Response.Write (s);//"var points = "+s);
  //Close the connections
  data.Close ();
  reader.Close ();

}

</script>