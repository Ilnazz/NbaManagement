using System;
using System.Collections.Generic;
using NbaManagement.Mvvm.DependencyInjection;

namespace NbaManagement.Mvvm.Navigation
{
    public class NavigationService : INavigationService
    {
        public event Action<object> Navigated;
        
        #region Fields
        private readonly IServiceProvider _serviceProvider;
        
        private readonly Stack<object> _viewModelHistory = new Stack<object>();
        #endregion
        
        public NavigationService(IServiceProvider serviceProvider) =>
            _serviceProvider = serviceProvider ?? throw new ArgumentNullException(nameof(serviceProvider));

        public void Navigate(Type viewModelType)
        {
            var viewModel = _serviceProvider.GetRequiredService(viewModelType);
            _viewModelHistory.Push(viewModel);
            Navigated?.Invoke(viewModel);
        }

        public void Navigate(object viewModel)
        {
            _viewModelHistory.Push(viewModel);
            Navigated?.Invoke(viewModel);
        }

        public bool CanNavigateBack() => _viewModelHistory.Count > 1;

        public void NavigateBack()
        {
            if (!CanNavigateBack())
                throw new InvalidOperationException();

            _viewModelHistory.Pop();
            var viewModel = _viewModelHistory.Peek();
            Navigated?.Invoke(viewModel);
        }
    }
}