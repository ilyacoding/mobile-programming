using System;
using Android.Content;
using Xamarin.Forms;
using Xamarin.Forms.Platform.Android;

[assembly: ExportRenderer(typeof(GamesCatalogXamarin.MultiLineLabel), typeof(GamesCatalogXamarin.Droid.MultiLineLabelRendererDroid))]
namespace GamesCatalogXamarin.Droid
{
    public class MultiLineLabelRendererDroid : LabelRenderer
    {
        public MultiLineLabelRendererDroid(Context context) : base(context)
        {
        }

        protected override void OnElementChanged(ElementChangedEventArgs<Label> e)
        {
            base.OnElementChanged(e);

            var baseLabel = (MultiLineLabel)Element;

            if (baseLabel != null)
            {
                Control.SetSingleLine(false);
                Control.SetLines(baseLabel.Lines);
            }
        }
    }
}
