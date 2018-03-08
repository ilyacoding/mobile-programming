using GamesCatalogXamarin;
using GamesCatalogXamarin.iOS;
using Xamarin.Forms;
using Xamarin.Forms.Platform.iOS;

[assembly: ExportRenderer(typeof(MultiLineLabel), typeof(MultiLineLabelRendererIOS))]
namespace GamesCatalogXamarin.iOS
{
    public class MultiLineLabelRendererIOS : LabelRenderer
    {
        protected override void OnElementChanged(ElementChangedEventArgs<Label> e)
        {
            base.OnElementChanged(e);

            var baseLabel = (MultiLineLabel)Element;

            Control.Lines = baseLabel.Lines;
        }

    }
}