<%@ Page Title="Home Page" Language="C#"%>

<!Doctype 
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>
        Inimeste andmed xml failist
    </title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Xml runat="server" 
                DocumentSource="~/Sugupuu.xml"
                TransformSource="~/sudupuuLisa.xslt">
            </asp:Xml>
        </div>
    </form>
</body>
</html>
