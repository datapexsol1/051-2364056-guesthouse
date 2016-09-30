<%@ Page Title="" Language="C#" MasterPageFile="~/EmployePanel.master" AutoEventWireup="true" CodeFile="employeupdateevent.aspx.cs" Inherits="employeupdateevent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <% int eventid = int.Parse(Session["updateEventID"].ToString()); 

        event_calender eventInfo = events.retrieveSelectedEvent(eventid);
        %>

    <div class="right_col" role="main">
    <div class="row">
     <div class="col-md-12 col-sm-12 col-xs-12">
     <div class="x_content">
     <div class="col-md-9 col-sm-9 col-xs-12">
         <h3>Update Events</h3>


                                                   <input  type="hidden"  value="<%=eventid %>"   class="form-control"/>

                                <div class="row">
                                     <div class="col-md-5">
                                            <input  type="text" id="eventname" name="eventname" value="<% %>"  placeholder="Event name..." class="form-control">
                                         </div>
                                </div>
                                <div class="row">
                                     <div class="col-md-5">
                                            <input  type="text" id="eventdesc" name="eventdesc" value="<% %>" placeholder="Event description..." class="form-control"/>
                                         </div>
                                </div>
                                <div class="row">
                                     <div class="col-md-5">
                                            <input  type="date" id="eventstartdate" name="eventstartdate"  class="form-control" runat="server"/>
                                         </div>
                                </div>
                                <div class="row">
                                     <div class="col-md-5">
                                            <input  type="date" id="eventenddate" name="eventenddate"  placeholder="Select date..." class="form-control" runat="server"/>
                                         </div>
                                </div>
                                <div class="row">
                        <div class="col-md-5">
                          <div class="input-group demo2">
                            <input type="text"  placeholder="Select color.." class="form-control" runat="server" id="eventcolor" name="eventcolor"/>
                            <span class="input-group-addon"><i></i></span>
                          </div>
                        </div>
                      </div>
                              <%--<asp:Button ID="eventsubmit" runat="server" Text="Submit" class="btn btn-success" OnClick="eventsubmit_Click" AutoPostBack="false" CausesValidation="true" />--%>
                              
                              
     </div>
         </div>
         </div></div></div>                         
                              
                     

</asp:Content>

