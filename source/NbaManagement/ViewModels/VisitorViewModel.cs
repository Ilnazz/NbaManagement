using NbaManagement.Mvvm.Navigation;
using NbaManagement.ViewModels.Base;

namespace NbaManagement.ViewModels
{
    public class VisitorViewModel : NavigatableTitledViewModel
    {
        public VisitorViewModel(INavigationService navigationService) : base(navigationService)
        {
            Title = "Visitor Menu";
        }
    }
}