using System;

using Xamarin.Forms;
using Xamarin.Forms.Platform.iOS;

[assembly: ExportRenderer(typeof(GamesCatalogXamarin.MultiLineLabel), typeof(GamesCatalogXamarin.iOS.MultiLineLabelRendererIOS))]
namespace GamesCatalogXamarin.iOS
{
    public class MultiLineLabelRendererIOS : LabelRenderer
    {
        protected override void OnElementChanged(ElementChangedEventArgs<Label> e)
        {
            base.OnElementChanged(e);

            var baseLabel = Element as MultiLineLabel;

            if (baseLabel != null && baseLabel.Lines != -1)
            {
                Control.Lines = baseLabel.Lines;
            }
        }
    }
}
