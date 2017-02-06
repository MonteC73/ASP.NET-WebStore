<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductList.aspx.cs" Inherits="WebStore.ProductList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <section>
        <div>
            <hgroup>
                <h2><%: Page.Title %></h2>
            </hgroup>       
            
            <div class="row">
                <div class="col-md-2"></div>
                <div class="col-md-10">
                        <asp:ListView ID="productList" runat="server" 
                            DataKeyNames="ProductID" GroupItemCount="5"
                            ItemType="WebStore.Models.Product" SelectMethod="GetProducts">
                            <EmptyDataTemplate>
                                <table >
                                    <tr>
                                        <td>No data was returned.</td>
                                    </tr>
                                </table>
                            </EmptyDataTemplate>
                            <EmptyItemTemplate>
                                <td/>
                            </EmptyItemTemplate>
                            <GroupTemplate>
                                <tr id="itemPlaceholderContainer" runat="server">
                                    <td id="itemPlaceholder" runat="server"></td>
                                </tr>
                            </GroupTemplate>

                            <ItemTemplate>
                                <td runat="server" class="list-group-item" style="width: 160px;">
                                    <table>
                                        <tr>
                                            <td>
                                                <a href="ProductDetails.aspx?productID=<%#:Item.ProductID%>">
                                                    <img src="/Catalog/Images/Thumbs/<%#:Item.ImagePath%>"
                                                         style="width: 100%; height:100px" /></a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <a href="ProductDetails.aspx?productID=<%#:Item.ProductID%>">
                                                    <span class="ProductName">
                                                        <%#:Item.ProductName%>
                                                    </span>
                                                </a>
                                                <br />
                                                <span>
                                                    <b>Price: </b><%#:String.Format("{0:c}", Item.UnitPrice)%>
                                                </span>
                                                <br />
                                                <a href="/AddToCart.aspx?productID=<%#:Item.ProductID %>">
                                                    <span class="ProductListItem">
                                                        <b>Add To Cart</b>
                                                    </span>
                                                </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>&nbsp;</td>
                                        </tr>
                                    </table>
                                    </p>
                                </td>
                            </ItemTemplate>
                            <LayoutTemplate>
                                <table  style="width:100%;">
                                    <tbody>
                                        <tr>
                                            <td>
                                                <table id="groupPlaceholderContainer" runat="server" style="width:100%">
                                                    <tr id="groupPlaceholder"></tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                        </tr>
                                        <tr></tr>
                                    </tbody>
                                </table>
            <%--                    <asp:DataPager runat="server" ID="DataPager" PageSize="5" >
                                    <Fields>
                                        <asp:NumericPagerField 
                                            ButtonCount="5"
                                            PreviousPageText="<--"
                                            NextPageText="-->" />
                                    </Fields>
                                </asp:DataPager>--%>
                                <div class="text-center">
                                <asp:DataPager ID="it" runat="server" class="btn-group btn-group-sm" PageSize="5">
                                    <Fields >
                                        <asp:NextPreviousPagerField PreviousPageText="<" FirstPageText="|<" ShowPreviousPageButton="true"
                                        ShowFirstPageButton="false" ShowNextPageButton="false" ShowLastPageButton="false"
                                        ButtonCssClass="btn btn-default" RenderNonBreakingSpacesBetweenControls="false" RenderDisabledButtonsAsLabels="false" />
                                        <asp:NumericPagerField ButtonType="Link" CurrentPageLabelCssClass="btn btn-primary disabled"  RenderNonBreakingSpacesBetweenControls="false"
                                        NumericButtonCssClass="btn btn-default" ButtonCount="5" NextPageText="..." NextPreviousButtonCssClass="btn btn-default" />
                                        <asp:NextPreviousPagerField NextPageText=">" LastPageText=">|" ShowNextPageButton="true"
                                        ShowLastPageButton="false" ShowPreviousPageButton="false" ShowFirstPageButton="false"
                                        ButtonCssClass="btn btn-default" RenderNonBreakingSpacesBetweenControls="false" RenderDisabledButtonsAsLabels="false"/>
                                   </Fields>
                               </asp:DataPager>
                               </div>
                            </LayoutTemplate>
                        </asp:ListView>
                    </div>
            </div>
        </div>
    </section>
</asp:Content>
