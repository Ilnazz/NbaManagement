using System.Windows.Controls;
using NbaManagement.Mvvm.DependencyInjection;
using NbaManagement.ViewModels;

namespace NbaManagement.Views
{
    public partial class StatusBarView : UserControl
    {
        public StatusBarView()
        {
            InitializeComponent();

            DataContext = Ioc.Default.GetRequiredService<StatusBarViewModel>();
        }
    }
}