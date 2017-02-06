<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ShoppingCart.aspx.cs" Inherits="WebStore.ShoppingCart" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div id="ShoppingCartTitle" runat="server" class="ContentHead">
        <h1>Shopping Cart</h1>
    </div>
    <asp:GridView ID="CartList" runat="server" AutoGenerateColumns="False" GridLines="None" ShowFooter="True" CellPadding="4"
        ItemType="WebStore.Models.CartItem" SelectMethod="GetShoppingCartItems" DataKeyNames="ProductId"
        CssClass="table table-striped table-hover">
        <Columns>
           <%-- <asp:TemplateField HeaderText="Picture">
                <ItemTemplate>
                    <img src="/Catalog/Images/Thumbs/<%#:Item.Product.ImagePath %>" style="border:solid; height: 60px; width:80px" alt="<%#:Item.Product.ProductName %>"/>
                </ItemTemplate>
            </asp:TemplateField> --%>

            <%--  <asp:BoundField DataField="Product.ImagePath" HeaderText="Picture2" /> --%>

            <%--  <asp:BoundField DataField="Product.ProductName" HeaderText="Name" />  --%>
            
            <%--  <asp:HyperLinkField DataNavigateUrlFields="ProductId" DataNavigateUrlFormatString="ProductDetails.aspx?productID={0}" DataTextField="DateCreated" HeaderText="Product Name"/> --%>
            
            <asp:TemplateField HeaderText="Product Name">
                <ItemTemplate>
                    <img src="/Catalog/Images/Thumbs/<%#:Item.Product.ImagePath %>" style="border-style:none; height: 60px; width:80px" alt="<%#:Item.Product.ProductName %>"/>
                    <asp:HyperLink runat="server" NavigateUrl='<%#: "ProductDetails.aspx?productID=" + Item.Product.ProductID %>'><%#:Item.Product.ProductName %></asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:BoundField DataField="Product.UnitPrice" HeaderText="Price (each)" DataFormatString="{0:c}" />

            <asp:TemplateField HeaderText="Quantity">
                <ItemTemplate>
                    <asp:TextBox ID="PurchaseQuantity" Width="40" runat="server" Text="<%#: Item.Quantity %>"></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Item Total">
                <ItemTemplate>
                    <%#: String.Format("{0:c}", ((Convert.ToDouble(Item.Quantity)) * Convert.ToDouble(Item.Product.UnitPrice)))%>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Button ID="Button1" runat="server" Text="x" OnClick="RemoveBtn_Click" class="btn btn-warning btn-xs"/>
                </ItemTemplate>
            </asp:TemplateField>

            <%-- <asp:BoundField DataField="ProductID" HeaderText="ID" SortExpression="ProductID" />  --%>
        </Columns>
    </asp:GridView>
    <div>
        <p></p>
        <strong>
            <asp:Label ID="LabelTotalText" runat="server" Text="Order Total: "></asp:Label>
            <asp:Label ID="lblTotal" runat="server" EnableViewState="false"></asp:Label>
        </strong>
    </div>
    <br />
    <table>
        <tr>
            <td>
                <asp:Button ID="UpdateBtn" runat="server" Text="Update" OnClick="UpdateBtn_Click" class="btn btn-default"/>
            </td>
            <td>
                <!--Checkout Placeholder -->
            </td>
        </tr>
    </table>
</asp:Content>
