using NbaManagement.Mvvm.DependencyInjection;
using NbaManagement.ViewModels;
using System.Windows.Controls;

namespace NbaManagement.Views
{
    public partial class PhotoSliderView : UserControl
    {
        public PhotoSliderView()
        {
            InitializeComponent();

            DataContext = Ioc.Default.GetRequiredService<PhotoSliderViewModel>();
        }
    }
}