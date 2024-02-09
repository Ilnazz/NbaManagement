using System;
using NbaManagement.Mvvm.Input;
using NbaManagement.Mvvm.Navigation;

namespace NbaManagement.ViewModels.Base
{
    public abstract class NavigatableTitledViewModel : TitledViewModel
    {
        public IRelayCommand<Type> NavigateCommand { get; }
        
        protected NavigatableTitledViewModel(INavigationService navigationService) =>
            NavigateCommand = new RelayCommand<Type>(navigationService.Navigate);
    }
}