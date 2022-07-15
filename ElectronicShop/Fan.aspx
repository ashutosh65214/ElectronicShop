<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Fan.aspx.cs" Inherits="ElectronicShop.WebForm8" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>
        .dataList {
            padding: 20px;
        }

        span {
            font-size: 15px;
            font-weight: bold;
        }

        input[type=submit]{
            padding:5px;            
            font-weight:bold;
            background-color:#358ecb;
            border-radius:6px;
            cursor:pointer;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
     <div>
        <asp:DataList ID="dlProducts" runat="server" GridLines="Both" RepeatColumns="4" RepeatDirection="Horizontal">
            <ItemTemplate>
                <table class="dataList">
                    <tr>
                        <td>
                            <asp:Image ImageUrl='<%#Eval("ImagePath") %>' ID="imgProductImage" runat="server" Width="200" Height="200" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblPName" Text='<%#Eval("ProductName") %>' runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblPrice" Text='<% #Eval("Price", "{0:c}") %>' runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Button Text="Add to Cart" ID="BtnBuy" runat="server" />
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:DataList>
    </div>
</asp:Content>
