using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace GamesCatalogXamarin
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class FullGamePage : ContentPage
    {
        public Game Game { get; set; }

        public FullGamePage()
        {
            Game = new Game
            {
                Title = "Some sample text",
                FullDescription = "Some long text",
                ReleaseDate = "2018",
                Image = "csgo",
                FullImage = "csgofull"
            };
            BindingContext = this;
            InitializeComponent();
        }

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
