using System.Collections.Generic;
using NbaManagement.Mvvm.Navigation;
using NbaManagement.ViewModels.Base;

namespace NbaManagement.ViewModels
{
    public class MainViewModel : NavigatableTitledViewModel
    {
        public IEnumerable<object> Matchups { get; }
        
        public MainViewModel(INavigationService navigationService) : base(navigationService)
        {
            Title = "Welcome!";
        }
    }
}