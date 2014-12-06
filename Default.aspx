<%@ Page Title="" Language="VB" MasterPageFile="~/Master.master" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
        
        <div class="row">

            <div class="col-md-3">
                <p class="lead">Categorias</p>
                <div class="list-group">
                    <a href="#" class="list-group-item">Conciertos</a>
                    <a href="#" class="list-group-item">Eventos</a>
                    <a href="#" class="list-group-item">Deportes</a>
                </div>
            </div>

            <div class="col-md-9">

                <div class="row carousel-holder">

                    <div class="col-md-12">
                        <div id="carousel" class="carousel slide" data-ride="carousel">
                            <ol class="carousel-indicators">
                                <li data-target="#carousel" data-slide-to="0" class="active"></li>
                                <li data-target="#carousel" data-slide-to="1"></li>
                            </ol>
                            <div class="carousel-inner">
                                <div class="item active">
                                    <img class="slide-image" src="assets/images/banner1.jpg" alt=""/>
                                </div>
                                <div class="item">
                                    <img class="slide-image" src="assets/images/banner2.jpg" alt=""/>
                                </div>
                            </div>
                            <a class="left carousel-control" href="#carousel" data-slide="prev">
                                <span class="glyphicon glyphicon-chevron-left"></span>
                            </a>
                            <a class="right carousel-control" href="#carousel" data-slide="next">
                                <span class="glyphicon glyphicon-chevron-right"></span>
                            </a>
                        </div>
                    </div>

                </div>

                <div class="row">

                    <div class="col-sm-4 col-lg-4 col-md-4">
                        <div class="thumbnail">
                            <img src="assets/images/banner1.jpg" alt="">
                            <div class="caption">
                                <h4 class="pull-right">$19.99</h4>
                                <h4><a href="#">Deadmau5</a>
                                </h4>
                                <p>Lorem <a target="_blank" href="http://www.bootsnipp.com">ipsum</a> dolor sit amet, graeco interesset eloquentiam cu pro.
                                     Sea equidem invenire et, cum natum perfecto ei, sed libris scripta accommodare ei. Clita tollit maluisset eu cum.
                                     Qui erant dignissim concludaturque ne.</p>
                            </div>
                            
                        </div>
                    </div>

                    <div class="col-sm-4 col-lg-4 col-md-4">
                        <div class="thumbnail">
                            <img src="assets/images/banner2.jpg" alt="">
                            <div class="caption">
                                <h4 class="pull-right">$14.99</h4>
                                <h4><a href="#">Neon Run</a>
                                </h4>
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                            </div>
                            
                        </div>
                    </div>

                    <div class="col-sm-4 col-lg-4 col-md-4">
                        <div class="thumbnail">
                            <img src="assets/images/banner3.jpg" alt="">
                            <div class="caption">
                                <h4 class="pull-right">$44.99</h4>
                                <h4><a href="#">Taylor Swift</a>
                                </h4>
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-4 col-lg-4 col-md-4">
                        <div class="thumbnail">
                            <img src="assets/images/banner4.jpg" alt="">
                            <div class="caption">
                                <h4 class="pull-right">$34.99</h4>
                                <h4><a href="#">Billy Joel</a>
                                </h4>
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                            </div>
                            
                        </div>
                    </div>
                </div>

            </div>

        </div>


</asp:Content>









