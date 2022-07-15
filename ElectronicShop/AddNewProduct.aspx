<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AddNewProduct.aspx.cs" Inherits="ElectronicShop.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Add New Product</title>
    <link href="Content/Css/Product.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
     <div class="d1">
            <table>
                <tr>
                    <td colspan="3" align="center">
                        <label class="lblHead">Add New Product</label>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <asp:ValidationSummary ID="ValidationSummary1" ForeColor="Red" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>Product Name</label>
                    </td>
                    <td>
                        <asp:TextBox ID="TxtProductName" runat="server" />
                        <asp:RequiredFieldValidator ID="RfvPName" ToolTip="Please enter product name" ErrorMessage="Please enter product name" Text="*" ControlToValidate="TxtProductName" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>Description</label>
                    </td>
                    <td>
                        <asp:TextBox ID="TxtDescription" runat="server" />
                        <asp:RequiredFieldValidator ID="rfvDesc" ErrorMessage="Please enter Description" Text="*" ControlToValidate="TxtDescription" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>Category</label>
                    </td>
                    <td>
                        <asp:DropDownList ID="DdlCategories" runat="server">
                            <asp:ListItem Value="-1">--Please select--</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvCategory" ErrorMessage="Please select a category" InitialValue="-1" Text="*" ControlToValidate="DdlCategories" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>Price</label>
                    </td>
                    <td>
                        <asp:TextBox ID="TxtPrice" runat="server" />
                        <asp:RequiredFieldValidator ID="rfvPrice" ErrorMessage="Please enter price" Text="*" ControlToValidate="TxtPrice" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>Quantity</label>
                    </td>
                    <td>
                        <asp:TextBox ID="TxtQuantity" runat="server" />
                        <asp:RequiredFieldValidator ID="rfvQty" ErrorMessage="Please enter quantity" Text="*" ControlToValidate="TxtQuantity" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>Upload Image</label>

                    </td>
                    <td colspan="2">
                        <asp:FileUpload ID="ImgFileUpload" runat="server" /><br />
                        <span class="spanImg">(Image should be either jpg or png)</span>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label Text="" ID="lblMessage" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <asp:Button CssClass="btn" Text="Save" ID="BtnSave" runat="server" OnClick="BtnSave_Click" />
                        <asp:Button CssClass="btn" Text="Reset" ID="BtnReset" CausesValidation="false" runat="server" OnClick="BtnReset_Click" />
                    </td>
                </tr>
            </table>
        </div>
    
</asp:Content>
