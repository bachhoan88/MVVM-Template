package ${fragmentPackage};

import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.view.View;
import javax.inject.Inject;

import ${appPack}.BR;
import ${appPack}.R;
import ${appPack}.databinding.Fragment${fragmentName}Binding;
import ${basePackage}.BaseFragment;

public class ${fragmentClassName} extends BaseFragment<Fragment${fragmentName}Binding, ${fragmentName}FragmentViewModel> implements
        ${fragmentName}FragmentNavigator {

    @Inject
    ${fragmentName}FragmentViewModel ${classToResource(fragmentName)}FragmentViewModel;

    public static ${fragmentName}Fragment newInstance() {
        Bundle bundle = new Bundle();

        ${fragmentName}Fragment fragment = new ${fragmentName}Fragment();
        fragment.setArguments(bundle);
        return fragment;
    }

    @Override
    public void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        ${classToResource(fragmentName)}FragmentViewModel.setNavigator(this);
    }

    @Override
    public ${fragmentName}FragmentViewModel getViewModel() {
        return ${classToResource(fragmentName)}FragmentViewModel;
    }

    @Override
    public int getBindingVariable() {
        return BR.viewModel;
    }

    @Override
    public int getLayoutId() {
        return R.layout.fragment_${classToResource(fragmentName)};
    }
}
