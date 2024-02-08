using NbaManagement.Mvvm.Input;
using NbaManagement.Mvvm.Navigation;
using NbaManagement.ViewModels.Base;

namespace NbaManagement.ViewModels
{
    public class NavigationViewModel : TitledViewModel
    {
        private object _currentViewModel;
        public object CurrentViewModel
        {
            get => _currentViewModel;
            set => SetProperty(ref _currentViewModel, value);
        }
        
        public IRelayCommand NavigateBackCommand { get; }

        public NavigationViewModel(INavigationService navigationService)
        {
            NavigateBackCommand = new RelayCommand(() =>
            {
                navigationService.NavigateBack();
                NavigateBackCommand.NotifyCanExecuteChanged();
            },
                navigationService.CanNavigateBack
            );
            
            navigationService.Navigated += viewModel =>
            {
                CurrentViewModel = viewModel;
                Title = viewModel is TitledViewModel titledViewModel ? titledViewModel.Title : string.Empty;
                NavigateBackCommand.NotifyCanExecuteChanged();
            };
        }
    }
}