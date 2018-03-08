using System.Collections.Generic;
using System.IO;
using Xamarin.Forms;

namespace GamesCatalogXamarin
{
    public partial class GamesCatalogXamarinPage : ContentPage
    {
        public List<Game> Games { get; set; }

        public GamesCatalogXamarinPage()
        {
            LoadPlayers();
            BindingContext = this;
            InitializeComponent();
        }

        void ItemSelected(object sender, SelectedItemChangedEventArgs e)
        {
            if (e.SelectedItem != null)
            {
                Game game = e.SelectedItem as Game;
                ((ListView)sender).SelectedItem = null;
                Navigation.PushAsync(new FullGamePage(game));
            }
        }

        void LoadPlayers()
        {

            #if __IOS__
            var resourcePrefix = "GamesCatalogXamarin.iOS.";
            #endif
            #if __ANDROID__
            var resourcePrefix = "GamesCatalogXamarin.Droid.";
            #endif
            var assembly = typeof(GamesCatalogXamarinPage).Assembly;
            Stream stream = assembly.GetManifestResourceStream(resourcePrefix + "games.json");
            string text = "";
            using (var reader = new StreamReader(stream))
            {
                text = reader.ReadToEnd();
            }
            Games = Newtonsoft.Json.JsonConvert.DeserializeObject<List<Game>>(text);
        }
    }
}
