using System;
using System.Collections.Generic;

using Xamarin.Forms;

namespace GamesCatalogXamarin
{
    public partial class GameWebPage : ContentPage
    {
        public String Link { get; set; }

        public GameWebPage(string link)
        {
            Link = link;
            BindingContext = this;
            InitializeComponent();
        }
    }
}
