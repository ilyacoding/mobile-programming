using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace GamesCatalogXamarin
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class FullGamePage : ContentPage
    {
        public Game Game { get; set; }

        public FullGamePage(Game game)
        {
            Game = game;
            BindingContext = this;
            InitializeComponent();
        }

        public void OnLinkClicked()
        {
            Navigation.PushAsync(new GameWebPage(Game.Url));
        }
    }
}
