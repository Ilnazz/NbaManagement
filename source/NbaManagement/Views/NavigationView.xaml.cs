using System.Windows.Controls;
using NbaManagement.Mvvm.DependencyInjection;
using NbaManagement.ViewModels;

namespace NbaManagement.Views
{
    public partial class NavigationView : UserControl
    {
        public NavigationView()
        {
            InitializeComponent();

            DataContext = Ioc.Default.GetRequiredService<NavigationViewModel>();
        }
    }
}