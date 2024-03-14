import { Navigate, Outlet } from 'react-router-dom';
import useAuthStore from '../store/useAuthStore';
import Tabbar from '@/components/Tabbar';

const PrivateRoute = () => {
  const { isAuthenticated } = useAuthStore();
  return isAuthenticated ? (
    <>
      <Outlet />
      <div className="fixed bottom-0 w-full border-t px-[27px] py-2 pb-[29px]">
        <Tabbar />
      </div>
    </>
  ) : (
    <Navigate to="/" />
  );
};

export default PrivateRoute;
