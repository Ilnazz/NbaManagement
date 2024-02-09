using System;

namespace NbaManagement.Mvvm.Navigation
{
    public interface INavigationService
    {
        event Action<object> Navigated;
        
        void Navigate(Type viewModelType);

        void Navigate(object viewModel);

        bool CanNavigateBack();

        void NavigateBack();
    }
}