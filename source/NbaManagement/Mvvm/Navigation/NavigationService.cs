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
        
        private readonly Stack<Type> _viewModelHistory = new Stack<Type>();
        #endregion
        
        public NavigationService(IServiceProvider serviceProvider) =>
            _serviceProvider = serviceProvider ?? throw new ArgumentNullException(nameof(serviceProvider));

        public void Navigate(Type viewModelType)
        {
            _viewModelHistory.Push(viewModelType);
            
            var viewModel = _serviceProvider.GetRequiredService(viewModelType);
            Navigated?.Invoke(viewModel);
        }

        public bool CanNavigateBack() => _viewModelHistory.Count > 1;

        public void NavigateBack()
        {
            if (!CanNavigateBack())
                throw new InvalidOperationException();

            _viewModelHistory.Pop();

            var viewModelType = _viewModelHistory.Peek();
            var viewModel = _serviceProvider.GetRequiredService(viewModelType);
            Navigated?.Invoke(viewModel);
        }
    }
}